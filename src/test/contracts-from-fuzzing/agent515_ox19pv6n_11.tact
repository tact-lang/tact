message(404) DeepMsg {
    val: Int?;
}

struct Middle {
    deep: DeepMsg?;
}

struct Outer {
    mid: Middle?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                deep: DeepMsg{
                    val: 555
                }
            }
        };
    }

    receive() {
        if (self.data.mid != null) {
            if (self.data.mid!!.deep != null) {
                let _ = self.data.mid!!.deep!!.val;
            }
        }
    }
}