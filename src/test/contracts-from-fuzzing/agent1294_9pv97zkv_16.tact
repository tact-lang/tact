struct AAA { val: Int?; }
struct BBB { flag: Bool?; }
struct CCC { txt: String?; }

contract MultipleStructs {
    a: AAA = AAA{ val: null };
    b: BBB = BBB{ flag: true };
    c: CCC = CCC{ txt: null };
    receive() {}
}