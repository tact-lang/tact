struct Large1 { f1: Int; f2: Bool; f3: String; f4: Address; f5: Bool; }
struct Large2 { f6: Int; f7: Bool; f8: String; f9: Address; f10: Bool; }

contract TestContract {
    s1: Large1;
    s2: Large2;

    init() {
        self.s1 = Large1{ f1:1, f2:true, f3:"a", f4:myAddress(), f5:false };
        self.s2 = Large2{ f6:2, f7:false, f8:"b", f9:myAddress(), f10:true };
    }
}