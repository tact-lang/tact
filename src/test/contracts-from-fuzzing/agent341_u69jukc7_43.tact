struct Wide {
  i1:Int; i2:Int; i3:Int; i4:Int; i5:Int; i6:Int; i7:Int; i8:Int; i9:Int; i10:Int;
  i11:Int; i12:Int; i13:Int; i14:Int; i15:Int; i16:Int; i17:Int; i18:Int; i19:Int; i20:Int;
  i21:Int; i22:Int; i23:Int; i24:Int; i25:Int; i26:Int; i27:Int; i28:Int; i29:Int; i30:Int;
}

contract TestContract {
  f: Wide;

  init() {
    self.f = Wide{
      i1:1,i2:2,i3:3,i4:4,i5:5,i6:6,i7:7,i8:8,i9:9,i10:10,
      i11:11,i12:12,i13:13,i14:14,i15:15,i16:16,i17:17,i18:18,i19:19,i20:20,
      i21:21,i22:22,i23:23,i24:24,i25:25,i26:26,i27:27,i28:28,i29:29,i30:30
    };
  }
}