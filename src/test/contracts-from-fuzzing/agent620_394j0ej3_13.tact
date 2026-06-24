struct Inner {
    id: Int;
    flag: Bool?;
}

struct Outer {
    innerOpt: Inner?;
    txt: String?;
}

contract TestContract {
    data: Outer?;

    init() {
        self.data = null;
    }

    receive() {
        if (self.data != null) {
            if (self.data!!.innerOpt != null) {
                let _ = self.data!!.innerOpt!!.id;
                if (self.data!!.innerOpt!!.flag != null) {
                    let _ = self.data!!.innerOpt!!.flag!!;
                }
            }
            if (self.data!!.txt != null) {
                let _ = self.data!!.txt!!;
            }
        }
    }
}