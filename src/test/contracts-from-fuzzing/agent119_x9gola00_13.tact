struct Inner {
    flag: Bool?;
    text: String;
}

struct Outer {
    arrA: Inner;
    arrB: Inner;
    arrC: Inner;
}

contract TestContract {
    payload: Outer;

    init() {
        self.payload = Outer{
            arrA: Inner{flag:true, text:"hello"},
            arrB: Inner{flag:null, text:"world"},
            arrC: Inner{flag:false, text:"!"}
        };
    }

    receive() {
        let _ = self.payload;
    }
}