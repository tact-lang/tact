struct MixedInner {
    foo: Int;
    bar: Bool;
    s: String;
}

contract MixedNestedTest {
    val: MixedInner;
    init() {
        self.val = MixedInner{foo:1, bar:true, s:"hi"};
    }
}