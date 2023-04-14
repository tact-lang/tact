fun sample3(src: Struct2?): OptStruct {
    return OptStruct{s: src};
}

fun sample4(src: Struct2): OptStruct {
    return OptStruct{s: src};
}

message Struct2 {
    v: Int;
}

struct OptStruct {
    s: Struct2?;
}

contract Opt2 {
    stateInit: StateInit;
    init() {
        self.stateInit = initOf Opt3(Struct2{v: 1});
    }

    receive("Test") {
        self.sample(Struct2{v: 1});
        self.sample(null);
        self.sample2(Struct2{v: 1});
        sample3(Struct2{v: 1});
        sample3(null);
        sample4(Struct2{v: 1});
    }

    fun sample(src: Struct2?) {

    }

    fun sample2(src: Struct2) {

    }
}

contract Opt3 {
    init(arg: Struct2?) {
        
    }
}