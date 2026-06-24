// deeply nested optionals
struct Opt2 {
  foo: Int?;
  bar: Bool?;
}

struct Opt1 {
  nested: Opt2?;
}

contract NestedOptionals {
    data: Opt1;

    init() {
        self.data = Opt1{
            nested: Opt2{ foo: null, bar: null }
        };
    }
}