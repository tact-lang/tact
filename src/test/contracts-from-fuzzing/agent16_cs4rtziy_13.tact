const MIX: Int = (3 ^ 1) * (ton("0.000000001") + (2 > 1 ? 10 : 20));

contract TestMix2 {
    get fun getMix() : Int {
         return MIX; // Expected: (3^1)=2, ton("0.000000001")=1, so inner = 1+10 = 11, product = 2*11 = 22
    }
}
