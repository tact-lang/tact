struct Inner1 { val1: Int }
struct Inner2 { val2: Int }
struct Container {
  a: Inner1;
  b: Inner2;
}

contract SiblingStructsTest {
    s: Container;
    init() {
        self.s = Container{
            a: Inner1{ val1: 1 },
            b: Inner2{ val2: 2 },
        };
    }
}