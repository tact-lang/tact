struct NestedOptionalString {
    s: String?;
}

contract NestedStringOptionalField {
    data: NestedOptionalString = NestedOptionalString{s:null};
    receive() {
        if (self.data.s != null) {
            let _ = self.data.s!!;
        }
    }
}