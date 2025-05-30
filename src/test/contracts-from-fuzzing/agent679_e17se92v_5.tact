struct Mixed {
    req1: Int;
    opt1: Bool?;
    req2: Bool;
    opt2: Int?;
}

contract TestContract {
    data: Mixed = Mixed{req1: 1, opt1: null, req2: true, opt2: null};
}