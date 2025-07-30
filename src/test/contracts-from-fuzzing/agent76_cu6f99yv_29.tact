// Chain of nested optional structs
struct Opt1 { next: Opt2? }
struct Opt2 { next: Opt3? }
struct Opt3 { val: Int? }

contract NestedOpts {
    nested: Opt1;
    init() {
        self.nested = Opt1{ next: Opt2{ next: Opt3{ val: null } } };
    }
}