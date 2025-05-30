struct SDefaultOptional {
    foo: Int? = null;
}

contract UseDefaultOptionalStruct {
    data: SDefaultOptional = SDefaultOptional{};
    receive() {
        if(self.data.foo != null) { let _ = self.data.foo!!; }
    }
}