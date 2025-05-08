struct InnerData {
    x: Int;
}

contract OptionalStructField {
    data: InnerData?;

    receive() {
        let _ = self.data;
    }
}