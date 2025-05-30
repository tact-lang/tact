struct InnerOption {
    x: Int;
    y: Int?
}

struct OuterOptional {
    inner: InnerOption;
    m: map<Int, Int>
}

contract OptionalTest {
    receive() {
        let o: OuterOptional = OuterOptional{
            inner: InnerOption{ x: 100, y: 200 },
            m: emptyMap()
        };
    }
}
