struct Mix {
  a:Int; b:String; c:Bool; d:Int?; e:String?; f:Bool?;
}

contract MultiMixes {
    s1:Mix;
    s2:Mix;

    init() {
      self.s1 = Mix{ a:1, b:"s1", c:true, d:null, e:"x", f:false };
      self.s2 = Mix{ a:2, b:"s2", c:false, d:7, e:null, f:true };
    }
}