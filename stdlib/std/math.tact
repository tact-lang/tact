// Prepare random

@name(randomize)
native nativeRandomize(x: Int);

@name(randomize_lt)
native nativeRandomizeLt();

@name(__tact_prepare_random)
native nativePrepareRandom();

// Random

@name(random)
native nativeRandom(): Int;

@name(rand)
native nativeRandomInterval(max: Int): Int;

inline fun randomInt(): Int {
    nativePrepareRandom();
    return nativeRandom();
}

inline fun random(min: Int, max: Int): Int {
    nativePrepareRandom();
    return min + nativeRandomInterval(max - min);
}

// Math

@name(min)
native min(x: Int, y: Int): Int;

@name(max)
native max(x: Int, y: Int): Int;

@name(abs)
native abs(x: Int): Int;

@name(now)
native now(): Int;

@name(__tact_log2)
native log2(num: Int): Int;

@name(__tact_log)
native log(num: Int, base: Int): Int;

@name(__tact_pow)
native pow(base: Int, exp: Int): Int;

@name(__tact_pow2)
native pow2(exp: Int): Int;