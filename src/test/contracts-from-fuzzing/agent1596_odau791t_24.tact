struct OptionalStringStruct {
    txt: String?;
}
contract OptStringFieldContract {
    os: OptionalStringStruct = OptionalStringStruct{ txt: null };
    receive() {
        let _ = self.os.txt;
    }
}