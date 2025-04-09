struct Innermost {
    flag: Bool?;
    num: Int?;
}

struct Inner {
    left: Innermost?;
    right: Innermost?;
}

contract OptionalTree {
    data: Inner;

    init() {
        self.data = Inner{
            left: Innermost{
                flag: null,
                num: 123,
            },
            right: null,
        };
    }

    receive() {
        if (self.data.left != null) {
            let _ = self.data.left!!.flag;
            let _ = self.data.left!!.num;
        }
        let _ = self.data.right;
    }
}