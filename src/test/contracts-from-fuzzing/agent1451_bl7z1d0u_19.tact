struct OverlappingNames {
 x: Int;
 y: Int;
 z: Int;
}

contract OverlapTest {
 data: OverlappingNames;

 init() {
   self.data = OverlappingNames{x:1,y:2,z:3};
 }
}
