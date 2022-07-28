struct Cell {
  c: builtin_Cell
}

// Do not change place of builder struct - for internal reasons
// it should be second struct in the file.
struct Builder {
  inner: builtin_Builder

  fn new() -> Self {
    Self { inner: builtin_begin_cell() }
  }
  fn build(self: Self) -> Cell {
    Cell { c: builtin_end_cell(self.inner) }
  }
  fn serialize_int(self: Self, int: Integer, bits: Integer) -> Self {
    Self { inner: builtin_store_int(self.inner, int, bits) }
  }
  fn serialize_uint(self: Self, uint: Integer, bits: Integer) -> Self {
    Self { inner: builtin_store_uint(self.inner, uint, bits) }
  }
  fn serialize_coins(self: Self, c: Integer) -> Self {
    Self { inner: builtin_store_coins(self.inner, c) }
  }
}

struct Slice {
  s: builtin_Slice

  fn parse(cell: Cell) -> Self {
    Self { s: builtin_begin_parse(cell.c) }
  }

  fn load_int(self: Self, bits: Integer) -> LoadResult[Integer] {
    let output = builtin_load_int(self.s, bits);
    let slice = Self { s: output.value1 };
    let int = output.value2;
    LoadResult[Integer] { slice: slice, value: int }
  }

  fn load_uint(self: Self, bits: Integer) -> LoadResult[Integer] {
    let output = builtin_load_uint(self.s, bits);
    let slice = Self { s: output.value1 };
    let int = output.value2;
    LoadResult[Integer] { slice: slice, value: int }
  }

  fn load_bits(self: Self, bits: Integer) -> LoadResult[Self] {
    let output = builtin_load_bits(self.s, bits);
    let slice = Self { s: output.value1 };
    let slice2 = Self { s: output.value2 };
    LoadResult[Self] { slice: slice, value: slice2 }
  }

  fn load_coins(self: Self) -> LoadResult[Integer] {
    let output = builtin_load_coins(self.s);
    let slice = Self { s: output.value1 };
    let coins = Self { s: output.value2 };
    LoadResult[Integer] { slice: slice, value: coins }
  }
}

fn throw(n: Integer) {
  builtin_throw(n);
}

struct Coins {
  value: Integer

  fn new(c: Integer) -> Self {
    Self { value: c }
  }

  impl Serialize {
    fn serialize(self: Self, builder: Builder) -> Builder {
      builder.serialize_coins(self.value)
    } 
  }

  impl Deserialize {
    fn deserialize(s: Slice) -> LoadResult[Self] {
      let {slice, value} = s.load_coins();
      LoadResult[Self].new(Self { value: value }, slice)
    } 
  }
}

struct Int[bits: Integer] {
  value: Integer

  fn new(i: Integer) -> Self {
    Self { value: i }
  }

  impl Serialize {
    fn serialize(self: Self, builder: Builder) -> Builder {
      builder.serialize_int(self.value, bits)
    } 
  }

  impl Deserialize {
    fn deserialize(s: Slice) -> LoadResult[Self] {
      let res = s.load_int(bits);
      let {slice, value} = res;
      
      LoadResult[Self] { 
        slice: slice, 
        value: Self { value: value }
      }
    }
  }

  impl From(Integer) {
    fn from(i: Integer) -> Self {
      Self { value: i }
    }
  }
}

struct Uint[bits: Integer] {
  value: Integer

  fn new(i: Integer) -> Self {
    Self { value: i }
  }

  impl Serialize {
    fn serialize(self: Self, builder: Builder) -> Builder {
      builder.serialize_uint(self.value, bits)
    } 
  }

  impl Deserialize {
    fn deserialize(s: Slice) -> LoadResult[Self] {
      let res = s.load_uint(bits);
      
      LoadResult[Self] { 
        slice: res.slice, 
        value: Self { value: res.value }
      }
    }
  }

  impl From(Integer) {
    fn from(i: Integer) -> Self {
      Self { value: i }
    }
  }
}

struct AddrNone {
  impl Serialize {
    fn serialize(self: Self, b: Builder) -> Builder {
      return b;
    }
  }
}

// Interesting situation with this declaration: `bits` field should have count of bits
// deriving from the `len` field which requires more powerful dependent types than we have for now.
// Do we want to make such declarations possible?
struct AddrExtern { 
  len: Int[9]
  bits: Integer

  impl Serialize {
    fn serialize(self: Self, b: Builder) -> Builder {
      let b = self.len.serialize(b);
      let b = b.serialize_int(self.bits, self.len.value);
      return b;
    }
  }

  impl Deserialize {
    fn deserialize(slice: Slice) -> LoadResult[Self] {
      let {value as len, slice} = Int[9].deserialize(slice);
      let {value as bits, slice} = slice.load_int(len);

      LoadResult[Self] { 
        slice: slice, 
        value: Self { 
          len: len,
          bits: bits,
        }
      }
    } 
  }
}

union MsgAddressExt {
  case AddrNone
  case AddrExtern

  impl Serialize {
    fn serialize(self: Self, b: Builder) -> Builder {
      serializer[Self](self, b)
    }
  }

  impl Deserialize {
    fn deserialize(s: Slice) -> LoadResult[Self] {
      let res_discr = s.load_int(1);
      if (builtin_equal(res_discr.value, 0)) {
        return LoadResult[Self].new(res_discr.slice, AddrNone{});
      } else if (builtin_equal(res_discr.value, 1)) {
        let res_addr = AddrExtern.deserialize(res_discr.slice);
        return LoadResult[Self].new(res_addr.slice, res_addr.value);
      } else {
        throw(0);
      }
    }
  }
}

struct AddressStd {
  workchain_id: Int[8]
  address: Int[256]

  fn new(workchain_id: Int[8], address: Int[256]) -> Self {
    Self {
      workchain_id: workchain_id,
      address: address,
    }
  }

  impl Serialize {
    fn serialize(self: Self, b: Builder) -> Builder {
      let b = b.serialize_int(0, 0); // AnyCast
      serializer[Self](self, b)
    }
  }

  impl Deserialize {
    fn deserialize(s: Slice) -> LoadResult[Self] {
      let res_anycast = s.load_int(1);
      if (builtin_equal(res_anycast.value, 0)) {
        return deserializer[Self](s);
      } else {
        throw(0); // unreachable
      }
    }
  }
}

struct AddressVar {
  len: Int[9]
  workchain_id: Int[8]
  address: Integer

  impl Serialize {
    fn serialize(self: Self, b: Builder) -> Builder {
      let b = b.serialize_int(0, 0); // AnyCast
      let b = serializer[Self](self, b);
      return b;
    }
  }

  impl Deserialize {
    fn deserialize(s: Slice) -> LoadResult[Self] {
      let res_anycast = s.load_int(1);
      if (builtin_equal(res_anycast.value, 0)) {
        let res_len = Int[9].deserialize(res_anycast.slice);
        let res_workchain = Int[8].deserialize(res_len.slice);
        let res_address = res_workchain.slice.load_int(res_len);
        return LoadResult[Self]
          .new(res_address.slice, Self {
            len: res_len.value,
            workchain_id: res_workchain.value,
            address: res_address.value,
          });
      } else {
        throw(0); // unreachable
      }
    }
  }
}

union MsgAddressInt {
  case AddressStd
  case AddressVar

  impl Serialize {
    fn serialize(self: Self, b: Builder) -> Builder {
      serializer[Self](self, b)
    }
  }

  impl Deserialize {
    fn deserialize(s: Slice) -> LoadResult[Self] {
      let res_discr = s.load_int(1);
      if (builtin_equal(res_discr.value, 0)) {
        let res_addr = AddressStd.deserialize(res_discr.slice);
        return LoadResult[Self].new(res_addr.slice, res_addr.value);
      } else {
        let res_addr = AddressVar.deserialize(res_discr.slice);
        return LoadResult[Self].new(res_addr.slice, res_addr.value);
      }
    }
  }
}
union MsgAddress {
  case MsgAddressExt
  case MsgAddressInt

  impl Serialize {
    fn serialize(self: Self, b: Builder) -> Builder {
      serializer[Self](self, b)
    }
  }

  impl Deserialize {
    fn deserialize(s: Slice) -> LoadResult[Self] {
      let res_discr = s.load_int(1);
      if (builtin_equal(res_discr.value, 0)) {
        let res_addr = MsgAddressExt.deserialize(res_discr.slice);
        return LoadResult[Self].new(res_addr.slice, res_addr.value);
      } else {
        let res_addr = MsgAddressInt.deserialize(res_discr.slice);
        return LoadResult[Self].new(res_addr.slice, res_addr.value);
      }
    }
  }
}

struct ExtOutMsgInfoRelaxed {
  src: MsgAddress
  dest: MsgAddressExt
  created_lt: Uint[64]
  created_at: Uint[32]

  impl Serialize {
    fn serialize(self: Self, b: Builder) -> Builder {
      return serializer[Self](self, b);
    }
  }
}

struct Timestamps {
  created_lt: Uint[64]
  created_at: Uint[32]

  fn zeros() -> Self {
    Self {
      created_lt: 0,
      created_at: 0,
    }
  }

  impl Serialize {
    fn serialize(self: Self, b: Builder) -> Builder {
      serializer[Self](self, b)
    }
  }

  impl Deserialize {
    fn deserialize(s: Slice) -> LoadResult[Self] {
      deserializer[Self](s)
    }
  }
}

struct IntMsgInfoFlags {
  ihr_disabled: Int[1]
  bounce: Int[1]
  bounced: Int[1]

  impl Serialize {
    fn serialize(self: Self, b: Builder) -> Builder {
      serializer[Self](self, b)
    }
  }

  impl Deserialize {
    fn deserialize(s: Slice) -> LoadResult[Self] {
      deserializer[Self](s)
    }
  }
}

struct IntMsgInfoAddresses {
  src: MsgAddressInt
  dst: MsgAddressInt

  impl Deserialize {
    fn deserialize(s: Slice) -> LoadResult[Self] {
      deserializer[Self](s)
    }
  }
}

struct IntMsgInfoCoins {
  ihr_fee: Coins
  fwd_fee: Coins

  impl Serialize {
    fn serialize(self: Self, b: Builder) -> Builder {
      serializer[Self](self, b)
    }
  }

  impl Deserialize {
    fn deserialize(s: Slice) -> LoadResult[Self] {
      deserializer[Self](s)
    }
  }
}

struct IntMsgInfo {
  flags: IntMsgInfoFlags
  addresses: IntMsgInfoAddresses
  coins: IntMsgInfoCoins
  timestamps: Timestamps

  fn new(
    flags: IntMsgInfoFlags, 
    dst: MsgAddressInt,
    coins: IntMsgInfoCoins,
  ) -> Self {
    Self {
      flags: flags,
      addresses: IntMsgInfoAddresses {
        src: AddressStd.new(0, 0), // it will be replaced by smartcontract address by TVM
        dst: dst,
      },
      coins: coins,
      timestamps: Timestamps.zeros(), // it will be replaced by current timestamps by TVM
    }
  }

  impl Deserialize {
    fn deserialize(s: Slice) -> LoadResult[Self] {
      deserializer[Self](s)
    }
  }
}

struct ExtInMsgInfo {
  src: MsgAddressExt
  dest: MsgAddressInt
  import_fee: Coins

  impl Deserialize {
    fn deserialize(s: Slice) -> LoadResult[Self] {
      deserializer[Self](s)
    }
  }
}

union CommonMsgInfo {
  case IntMsgInfo
  case ExtInMsgInfo

  impl Deserialize {
    fn deserialize(s: Slice) -> LoadResult[Self] {
      let res_discr1 = s.load_int(1);
      if (builtin_equal(res_discr1.value, 0)) {
        let res_info = IntMsgInfo.deserialize(res_discr1.slice);
        return LoadResult[Self].new(res_info.slice, res_info.value);
      } else {
        let res_discr2 = res_discr1.slice.load_int(1);
        if (builtin_equal(res_discr2.value, 0)) {
          let res_info = ExtInMsgInfo.deserialize(res_discr2.slice);
          return LoadResult[Self].new(res_info.slice, res_info.value);
        } else {
          throw(0); // unreachable
        }
      }
    }
  }
}

struct IntMsgInfoRelaxedAddresses {
  src: MsgAddress
  dst: MsgAddressInt

  impl Serialize {
    fn serialize(self: Self, b: Builder) -> Builder {
      serializer[Self](self, b)
    }
  }
}

struct IntMsgInfoRelaxed {
  flags: IntMsgInfoFlags
  addresses: IntMsgInfoRelaxedAddresses
  coins: IntMsgInfoCoins
  timestamps: Timestamps

  fn new(
    flags: IntMsgInfoFlags, 
    dst: MsgAddressInt,
    coins: IntMsgInfoCoins,
  ) -> Self {
    Self {
      flags: flags,
      addresses: IntMsgInfoRelaxedAddresses {
        src: AddressStd.new(0, 0), // it will be replaced by smartcontract address by TVM
        dst: dst,
      },
      coins: coins,
      timestamps: Timestamps.zeros(), // it will be replaced by current timestamps by TVM
    }
  }

  impl Serialize {
    fn serialize(self: Self, b: Builder) -> Builder {
      serializer[Self](self, b)
    }
  }
}

union CommonMsgInfoRelaxed {
  case ExtOutMsgInfoRelaxed
  case IntMsgInfoRelaxed

  impl Serialize {
    fn serialize(self: Self, b: Builder) -> Builder {
      switch(self) {
        case IntMsgInfoRelaxed info => {
          let b = b.serialize_int(0, 1);
          return info.serialize(b);
        }
        case ExtOutMsgInfoRelaxed info => {
          let b = b.serialize_int(3, 2); // 0b11
          return info.serialize(b);
        }
      }
    }
  }
}

struct MessageRelaxed[X: Serialize] {
  info: CommonMsgInfoRelaxed
  body: X

  impl Serialize {
    fn serialize(self: Self, b: Builder) -> Builder {
      let b = self.info.serialize(b);
      let b = b.serialize_int(0, 1); // init
      let b = b.serialize_int(0, 1); // body discriminant
      let b = self.body.serialize(b);
      return b;
    }
  }
}

struct Message[X: Deserialize] {
  info: CommonMsgInfo
  body: X

  impl Deserialize {
    fn deserialize(s: Slice) -> LoadResult[Self] {
      let res_info = CommonMsgInfo.deserialize(s);
      let res_init = res_info.slice.load_int(1);

      if (builtin_equal(res_init.value, 0)) {
        let res_body_discr = res_init.slice.load_int(1);
        if (builtin_equal(res_body_discr.value, 0)) {
          let body = X.deserialize(res_body_discr.slice);
          let mes = Self { info: res_info.value, body: body.value };
          return LoadResult[Self].new(body.slice, mes);
        } else {
          /* TODO: cells */
        }
      } else {
        throw(0);
      }
    }
  }
}

struct SendRawMsgFlags {
  value: Integer

  fn default() -> Self {
    Self { value: 0 }
  }

  fn carry_smart_contract_balance() -> Self {
    Self { value: 128 }
  }

  fn carry_rest_from_transaction_input() -> Self {
    Self { value: 64 }
  }
}

fn send_raw_msg(msg: Cell, flags: SendRawMsgFlags) -> VoidType {
  builtin_send_raw_msg(msg.c, flags.value);
}

fn send_internal[X: Serialize](header: IntMsgInfoRelaxed, body: X, flags: SendRawMsgFlags) -> VoidType {
  let info: CommonMsgInfoRelaxed = header;
  let msg = MessageRelaxed[X] { info: info, body: body };
  let ce = msg.serialize(Builder.new()).build();
  send_raw_msg(ce, flags);
}

fn send_external[X: Serialize](header: ExtOutMsgInfoRelaxed, body: X, flags: SendRawMsgFlags) -> VoidType {
  let info: CommonMsgInfoRelaxed = header;
  let msg = MessageRelaxed[X] { info: info, body: body };
  let ce = msg.serialize(Builder.new()).build();
  send_raw_msg(ce, flags);
}
