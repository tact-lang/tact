contract DefaultOptional {
    val: Int?;
    txt: String?;
    flag: Bool?;
    
    init() {
        self.val = null;
        self.txt = null;
        self.flag = null;
    }
}