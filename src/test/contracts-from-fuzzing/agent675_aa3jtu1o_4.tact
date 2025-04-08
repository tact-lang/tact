contract MultiPrimitiveFields {
    someInt: Int = 0;
    someBool: Bool = false;
    someStr: String = "hi";
    someOptInt: Int?;
    someOptBool: Bool?;

    receive() {
        dump(self.someStr);
    }
}