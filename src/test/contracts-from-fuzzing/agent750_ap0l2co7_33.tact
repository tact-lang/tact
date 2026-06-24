contract LargeOptionals {
  o1: Int?; o2: Int?; o3: Int?; o4: Int?; o5: Int?;
  o6: Bool?; o7: Bool?; o8: Bool?; o9: Bool?; o10: Bool?;
  init() {
    self.o1=1; self.o2=2; self.o3=null; self.o4=null; self.o5=5;
    self.o6=null; self.o7=true; self.o8=false; self.o9=null; self.o10=true;
  }
}