struct StructWithOptionDefaults {
 x: Int?; 
 y: Bool?; 
 z: String?;
}

contract UseOptDefaults {
 s: StructWithOptionDefaults;

 init() {
   self.s = StructWithOptionDefaults{ x: null, y: null, z: null };
 }
}