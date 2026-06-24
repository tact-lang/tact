struct Nest3 { val3: Int = 3; }
struct Nest2 { val2: Nest3 = Nest3{}; }
struct Nest1 { val1: Nest2 = Nest2{}; }

contract ChainNested {
    chain: Nest1 = Nest1{};
}