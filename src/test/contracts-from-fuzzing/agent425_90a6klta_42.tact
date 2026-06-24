// stress very large struct with optionals and defaults
struct Huge {
  f1: Int?; f2: Int=1; f3: Bool?; f4: Bool=true;
  f5: Int?; f6: Int=2; f7: Bool?; f8: Bool=false;
  f9: Int?; f10: Int=3; f11: Bool?; f12: Bool=false;
  f13: Int?; f14: Int=4; f15: Bool?; f16: Bool=true;
  f17: Int?; f18: Int=5; f19: Bool?; f20: Bool=false;
}

contract HugeTest {
    data: Huge;

    init() {
        self.data = Huge{ f1:null, f3:true, f5:5, f7:null, f9:9, f11:false, f13:13, f15:null, f17:17, f19:true };
    }
}