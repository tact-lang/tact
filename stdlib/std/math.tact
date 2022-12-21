@name(random)
native random(): Int;

@name(rand)
native randomInterval(max: Int): Int;

@name(randomize)
native randomize(x: Int);

@name(randomize_lt)
native randomizeLt();

@name(min)
native min(x: Int, y: Int): Int;

@name(max)
native max(x: Int, y: Int): Int;

@name(abs)
native abs(x: Int): Int;

@name(now)
native now(): Int;