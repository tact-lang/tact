// deeply nested optional bool chain
struct A { flag: Bool?; }
struct B { next: A?; }
struct C { next: B?; }
struct D { next: C?; }
struct E { next: D?; }

contract DeepBoolOpt {
    value: E;

    init() {
        self.value = E{
            next: null,
        };
    }
}