struct Params {
    enabled: Bool;
    threshold: Int;
}

contract MultiVar {
    param1: Params;
    param2: Params;
    param3: Params;
    count: Int;
    flag: Bool;
    text: String;

    init() {
        self.param1 = Params{enabled:true, threshold:1};
        self.param2 = Params{enabled:false,threshold:2};
        self.param3 = Params{enabled:true, threshold:3};
        self.count = 10;
        self.flag = false;
        self.text = "testing";
    }
}