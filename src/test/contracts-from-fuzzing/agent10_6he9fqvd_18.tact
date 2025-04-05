struct Many {
    one: Int;
    two: Int;
    three: Int;
    four: Int;
}

contract ManyDestructTest {
    receive() {
        let v = Many { one: 10, two: 20, three: 30, four: 40 };
        let Many { one, .. } = v;
        let s = one;
    }
}
