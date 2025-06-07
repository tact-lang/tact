struct DeepInner {
    x: Int;
    y: Int?;
}

struct Middle {
    inner: DeepInner;
    z: Int?;
}

contract DeepNestedTest {
    mid: Middle = Middle{ inner: DeepInner{x:3,y:null}, z:4 };
}