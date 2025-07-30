// deeply nested optional fields, param contract
struct L3 {
    foo: Int?;
}

struct L2 {
    l3: L3?;
}

struct L1 {
    l2: L2?;
}

contract ParamDeepOpt(
    l1: L1?  
) {
    receive() {
        if (self.l1 != null && self.l1!!.l2 != null && self.l1!!.l2!!.l3 != null && self.l1!!.l2!!.l3!!.foo != null) {
            let _ = self.l1!!.l2!!.l3!!.foo!!;
        }
    }
}