struct Inner1 { 
    x: Int;
}
struct Inner2 {
    y: Inner1;
}
struct Inner3 {
    z: Inner2;
}

contract NullableDeep {
    deep: Inner3?;

    init() {
        self.deep = null;
    }
}