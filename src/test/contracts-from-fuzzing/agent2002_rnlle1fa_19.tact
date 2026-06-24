struct OptionalStringInt {
    message: String?;
    number: Int?;
}

contract OptStrIntTest {
    data: OptionalStringInt;

    init() {
        self.data = OptionalStringInt{message:null, number:null};
    }
}
