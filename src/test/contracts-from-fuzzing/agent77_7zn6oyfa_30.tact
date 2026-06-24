// Many bool and bool? fields mixed
contract ManyBools {
    b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool;
    bo1: Bool?; bo2: Bool?; bo3: Bool?; bo4: Bool?; bo5: Bool?;

    init() {
      self.b1=true; self.b2=false; self.b3=true; self.b4=false; self.b5=true;
      self.bo1=null; self.bo2=null; self.bo3=null; self.bo4=null; self.bo5=null;
    }
}