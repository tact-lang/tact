struct Inner {
    x: Int;
    y: Int;
    flag: Bool;
    text: String;
}

contract StorageVariants {
    f1: Inner?;
    f2: Inner; 

    init() {
        self.f1 = null;
        self.f2 = Inner{
            x:1, y:2, flag:true, text:"text"
        };
    }
}
