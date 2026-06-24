struct SubPart {
    val: Int;
}

struct Part {
    a: SubPart;
    b: SubPart;
}

contract MultipleNestedSameStruct {
    p: Part;

    init() {
        self.p = Part{
            a: SubPart{ val: 5 },
            b: SubPart{ val: 6 },
        };
    }

    receive() {
        let z = self.p;
    }
}