// Contract field with nested struct with 'remaining' after optional
struct Special {
   flag: Bool?;
   data: Slice as remaining;
}

contract SpecRem {
   rec: Special;
   init() {
     self.rec = Special{
       flag: true,
       data: emptyCell().asSlice(),
     };
   }
}