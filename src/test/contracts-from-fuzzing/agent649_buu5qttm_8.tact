struct NestedOptional {
    inner: Int?;
    flag: Bool;
}

struct Wrapper {
    content: NestedOptional?; 
    description: String;
}

contract OptInStruct {
    w: Wrapper = Wrapper{
        content: null,
        description: ""
    };
    receive() {
        let _ = self.w.content;
    }
}