struct AAA { i: Int; opt: Int?; b: Bool; }
struct BBB { left: AAA; right: AAA; val: Int?; }
struct CCC { top: BBB; bottom: BBB; flag: Bool; }

contract TreeContract {
    data: CCC;

    init() {
        self.data = CCC{
            top: BBB{
                left: AAA{ i:1, opt:null, b:true },
                right: AAA{ i:2, opt:3, b:false },
                val: null
            },
            bottom: BBB{
                left: AAA{ i:4, opt:null, b:true },
                right: AAA{ i:5, opt:6, b:false },
                val: 7
            },
            flag: true
        };
    }
}
