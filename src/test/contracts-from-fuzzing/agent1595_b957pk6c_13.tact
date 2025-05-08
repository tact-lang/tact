struct OptStringHolder {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract TestContract {
    sh: OptStringHolder;

    init() {
        self.sh = OptStringHolder{s1: null, s2: "foo", s3: null};
    }
}