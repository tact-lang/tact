struct ContainingOptions {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Address?;
}

struct HasInner {
    inner: ContainingOptions;
    someVal: Int;
}

contract TestContract {
    obj: HasInner = HasInner{
        inner: ContainingOptions{
            opt1:null,opt2:true,opt3:"hi",opt4:null
        },
        someVal: 123
    };
}