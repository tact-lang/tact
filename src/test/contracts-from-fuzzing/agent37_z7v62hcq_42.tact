struct Mega {
// 50 int fields
 i1:Int; i2:Int; i3:Int; i4:Int; i5:Int; i6:Int; i7:Int; i8:Int; i9:Int; i10:Int;
 i11:Int; i12:Int; i13:Int; i14:Int; i15:Int; i16:Int; i17:Int; i18:Int; i19:Int; i20:Int;
 i21:Int; i22:Int; i23:Int; i24:Int; i25:Int; i26:Int; i27:Int; i28:Int; i29:Int; i30:Int;
 i31:Int; i32:Int; i33:Int; i34:Int; i35:Int; i36:Int; i37:Int; i38:Int; i39:Int; i40:Int;
 i41:Int; i42:Int; i43:Int; i44:Int; i45:Int; i46:Int; i47:Int; i48:Int; i49:Int; i50:Int;
// 50 bool fields
 b1:Bool; b2:Bool; b3:Bool; b4:Bool; b5:Bool; b6:Bool; b7:Bool; b8:Bool; b9:Bool; b10:Bool;
 b11:Bool; b12:Bool; b13:Bool; b14:Bool; b15:Bool; b16:Bool; b17:Bool; b18:Bool; b19:Bool; b20:Bool;
 b21:Bool; b22:Bool; b23:Bool; b24:Bool; b25:Bool; b26:Bool; b27:Bool; b28:Bool; b29:Bool; b30:Bool;
 b31:Bool; b32:Bool; b33:Bool; b34:Bool; b35:Bool; b36:Bool; b37:Bool; b38:Bool; b39:Bool; b40:Bool;
 b41:Bool; b42:Bool; b43:Bool; b44:Bool; b45:Bool; b46:Bool; b47:Bool; b48:Bool; b49:Bool; b50:Bool;
}

contract Test {
    huge: Mega;
    init() {
        self.huge = Mega{
            i1:1,i2:2,i3:3,i4:4,i5:5,i6:6,i7:7,i8:8,i9:9,i10:10,
            i11:11,i12:12,i13:13,i14:14,i15:15,i16:16,i17:17,i18:18,i19:19,i20:20,
            i21:21,i22:22,i23:23,i24:24,i25:25,i26:26,i27:27,i28:28,i29:29,i30:30,
            i31:31,i32:32,i33:33,i34:34,i35:35,i36:36,i37:37,i38:38,i39:39,i40:40,
            i41:41,i42:42,i43:43,i44:44,i45:45,i46:46,i47:47,i48:48,i49:49,i50:50,
            b1:true,b2:true,b3:true,b4:true,b5:true,b6:true,b7:true,b8:true,b9:true,b10:true,
            b11:true,b12:true,b13:true,b14:true,b15:true,b16:true,b17:true,b18:true,b19:true,b20:true,
            b21:true,b22:true,b23:true,b24:true,b25:true,b26:true,b27:true,b28:true,b29:true,b30:true,
            b31:true,b32:true,b33:true,b34:true,b35:true,b36:true,b37:true,b38:true,b39:true,b40:true,
            b41:true,b42:true,b43:true,b44:true,b45:true,b46:true,b47:true,b48:true,b49:true,b50:true
        };
    }
}