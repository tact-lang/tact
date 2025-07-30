struct SubOpt {
    foo: Int?;
}

struct TopOpt {
    nested: SubOpt?;
}

contract Test(
    data: TopOpt?,
) {
    receive() {
        if (self.data != null) {
            let _= self.data!!.nested;
        }
    }
}