struct Long {
  i1:Int;i2:Int;i3:Int;i4:Int;i5:Int;i6:Int;i7:Int;i8:Int;i9:Int;i10:Int;
  i11:Int;i12:Int;i13:Int;i14:Int;i15:Int;i16:Int;i17:Int;i18:Int;i19:Int;i20:Int;
}

contract TwentyInts {
  data: Long;

  init() {
    self.data = Long{
      i1:1,i2:2,i3:3,i4:4,i5:5,i6:6,i7:7,i8:8,i9:9,i10:10,
      i11:11,i12:12,i13:13,i14:14,i15:15,i16:16,i17:17,i18:18,i19:19,i20:20
    };
  }
}