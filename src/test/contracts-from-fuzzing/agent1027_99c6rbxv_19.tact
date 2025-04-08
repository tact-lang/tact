contract MaxIntValues {
  val8 : Int as int8 = 127;
  val16: Int as int16 = 32767;
  val32: Int as int32 = 2147483647;
  uval8: Int as uint8 = 255;
  uval16: Int as uint16 = 65535;
  uval32: Int as uint32 = 4294967295;

  init() {
    self.val8 = 0;
    self.val16 = 0;
    self.val32 = 0;
    self.uval8 = 0;
    self.uval16 = 0;
    self.uval32 = 0;
  }
}
