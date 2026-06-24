struct ManyStrings {
  s01: String;
  s02: String;
  s03: String;
  s04: String;
  s05: String;
  s06: String;
  s07: String;
  s08: String;
  s09: String;
  s10: String;
  s11: String;
  s12: String;
  s13: String;
  s14: String;
  s15: String;
  s16: String;
  s17: String;
  s18: String;
  s19: String;
  s20: String;
  s21: String;
  s22: String;
  s23: String;
  s24: String;
  s25: String;
  s26: String;
  s27: String;
  s28: String;
  s29: String;
  s30: String;
  s31: String;
  s32: String;
  s33: String;
  s34: String;
  s35: String;
  s36: String;
  s37: String;
  s38: String;
  s39: String;
  s40: String;
}

contract ManyStrs {
    strs: ManyStrings;
    init() {
        self.strs = ManyStrings{
            s01:"a", s02:"b", s03:"c", s04:"d", s05:"e",
            s06:"f", s07:"g", s08:"h", s09:"i", s10:"j",
            s11:"k", s12:"l", s13:"m", s14:"n", s15:"o",
            s16:"p", s17:"q", s18:"r", s19:"s", s20:"t",
            s21:"u", s22:"v", s23:"w", s24:"x", s25:"y",
            s26:"z", s27:"0", s28:"1", s29:"2", s30:"3",
            s31:"4", s32:"5", s33:"6", s34:"7", s35:"8",
            s36:"9", s37:"!", s38:"@", s39:"#", s40:"$"
        };
    }
    receive(){}
}