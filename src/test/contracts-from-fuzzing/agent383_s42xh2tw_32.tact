struct HasOpt {
    flag: Bool?;
}

contract OptStructField {
    data: HasOpt;
    init() {
        self.data = HasOpt{ flag:null };
    }
}
