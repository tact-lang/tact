struct CombineOptions {
    a: Int? as uint32;
    b: Bool?;
    c: String?;
}

contract CombineOptionsContract {
    data: CombineOptions;

    init() {
        self.data = CombineOptions { a:null, b:true, c:null };
    }
}