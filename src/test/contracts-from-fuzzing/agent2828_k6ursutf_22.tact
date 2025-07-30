struct Inner { 
    n: Int; 
}

message(5) Payload { 
    val: Int;
}

struct Middle {
    iOpt: Inner?;
    mOpt: Payload?;
}

contract FancyState {
    state: Middle;

    init() {
        self.state = Middle{
            iOpt: null,
            mOpt: null
        };
    }
}