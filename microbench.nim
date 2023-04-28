import times

# set run repetitions:
const RUNS: int64 = 65536

var start: Time = getTime()
var ende: Time = getTime()
var first: float32
var second: float32

# add variables for bench:

var a: int64 = 0


# add functoins for bench:

proc func1(): void = discard        # demo function

proc func2(): void = discard        # demo function


start = getTime()
for run in countup(1, RUNS):
    # 1st run

    a += 1
    # a += 2        # reverse test

    # bench functions
    func1()
    # func2()       # reverse test
ende = getTime()
first = (ende - start).inNanoseconds.float32

# reset bench variables:

a = 0


start = getTime()
for run in countup(1, RUNS):
    # 2nd run

    a += 2
    # a += 1        # reverse test

    # bench functions
    func2()
    # func1()       # reverse test
ende = getTime()
second = (ende - start).inNanoseconds.float32

# print result nanoseconds
# echo "1st run: ", first / RUNS.float32, " ns"
# echo "2nd run: ", second / RUNS.float32, " ns"

# print result microseconds
echo "1st run: ", first / RUNS.float32 / 1000.0, " µs"
echo "2nd run: ", second / RUNS.float32 / 1000.0, " µs"

# print result milliseconds
# echo "1st run: ", first / RUNS.float32 / 1.0e6, " ms"
# echo "2nd run: ", second / RUNS.float32 / 1.0e6, " ms"

# print result seconds
# echo "1st run: ", first / RUNS.float32 / 1.0e9, " s"
# echo "2nd run: ", second / RUNS.float32 / 1.0e9, " s"
