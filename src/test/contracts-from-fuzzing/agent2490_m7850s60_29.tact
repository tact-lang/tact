struct OptStringInt {
    s: String?;
    i: Int?;
}

contract OptStrIntContract {
    data: OptStringInt;

    init() {
        self.data = OptStringInt{s:null,i:null};
    }
}