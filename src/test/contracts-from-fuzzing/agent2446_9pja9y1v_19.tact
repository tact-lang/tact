struct ComposeLevel2 {
    a: Int;
    b: Bool;
}
struct ComposeLevel1 {
    x: ComposeLevel2;
    y: ComposeLevel2;
}

contract ComposeContract {
    inner: ComposeLevel1;

    init() {
        self.inner = ComposeLevel1{
            x: ComposeLevel2{a:1,b:true},
            y: ComposeLevel2{a:2,b:false}
        };
    }
}