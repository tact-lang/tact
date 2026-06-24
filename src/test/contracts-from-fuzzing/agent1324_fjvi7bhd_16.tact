struct InnerData {
    val: Int?;
}

contract MultiOptStructs {
    s1: InnerData?;
    s2: InnerData? = null;
    s3: InnerData?;

    init() {
        self.s1 = null;
        self.s3 = null;
    }
}