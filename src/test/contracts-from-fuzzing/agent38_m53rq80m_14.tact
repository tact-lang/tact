struct InnerOptional {
    I: Int;
}

struct InnerMap {
    // Map from Int to InnerOptional
    Data: map<Int, InnerOptional>;
}

struct NestedL2 {
    M: InnerMap;
}

struct NestedL1 {
    N: NestedL2;
    O: InnerOptional?; // optional field
}

message ComplexMsg {
    CM: NestedL1;
}

contract TestComplexNested {
    receive(msg: ComplexMsg) {
        // Attempt to unwrap map value and optional field
        let value: Int = msg.CM.N.M.Data.get(7)!!.I;
        if (msg.CM.O != null) {
            let optValue: Int = msg.CM.O!!.I;
        }
    }
}
