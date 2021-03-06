//	ADDA DualBand Generation Program
//	On Terasic DE0 Platform
// (C) 2012 TYLEE @ RFVLSI LAB, NCTU
// All Rights Reserved.


module din_syn(
	input clk_in,
	input  trig, 
	input  dump, 
	output clk,	//	.clk(GPIO_0_D[0]),	// CLOCK
	output  din,	// .din(GPIO_0_D[1]),	// Digital Input
	output  syn,	//	.syn(GPIO_0_D[2])		// Sync Signal		
	output reg out_en,	//	.syn(GPIO_0_D[2])		// Sync Signal		
	output reg clk_out_en
);

reg cnt_0;
reg clk_strobe;
reg [9:0]counter;
reg din_in;
reg syn_in;

parameter total_bits = 452; // 451

bufif1  b1(clk, clk_in, clk_out_en);	// Clock output with data only
bufif1  b2(syn, syn_in, out_en);	// Clock output with data only
bufif1  b3(din, din_in, out_en);	// Clock output with data only

wire trig_and_oenb = trig & !out_en;
wire trig_and_coenb = trig & !clk_out_en;

always @ (posedge trig_and_oenb or posedge dump or posedge cnt_0)// or posedge dump)
begin 	
	
	if(dump)
		out_en <= 1'b0;
	else if(cnt_0)
		out_en <= 1'b0;
   else if(trig_and_oenb)
		out_en <= 1'b1;	//	set wait signal
		
end // End of Always

always @ (posedge trig_and_coenb or posedge dump or posedge clk_strobe)// or posedge dump)
begin 	
	
	if(dump)
		clk_out_en <= 1'b0;
	else if(clk_strobe)
		clk_out_en <= 1'b0;
   else if(trig_and_coenb)
		clk_out_en <= 1'b1;	//	set wait signal
		
end // End of Always


always @ (negedge clk_in)
begin 	
			syn_in <=  (counter == total_bits)?1'b1:1'b0;
			
			case (counter) 
			0: din_in <=  1'b0;
			1: din_in <=  1'b0;	2: din_in <=  1'b0;	3: din_in <=  1'b0;	
			4: din_in <=  1'b0;	5: din_in <=  1'b0;	6: din_in <=  1'b0;	7: din_in <=  1'b0;	
			8: din_in <=  1'b0;	9: din_in <=  1'b0;	10: din_in <=  1'b0;	11: din_in <=  1'b0;	
			12: din_in <=  1'b0;	13: din_in <=  1'b0;	14: din_in <=  1'b0;	15: din_in <=  1'b0;	
			16: din_in <=  1'b0;	17: din_in <=  1'b0;	18: din_in <=  1'b0;	19: din_in <=  1'b0;	
			20: din_in <=  1'b0;	21: din_in <=  1'b0;	22: din_in <=  1'b0;	23: din_in <=  1'b0;	
			24: din_in <=  1'b0;	25: din_in <=  1'b0;	26: din_in <=  1'b0;	27: din_in <=  1'b0;	
			28: din_in <=  1'b0;	29: din_in <=  1'b0;	30: din_in <=  1'b0;	31: din_in <=  1'b0;	
			32: din_in <=  1'b0;	33: din_in <=  1'b0;	34: din_in <=  1'b0;	35: din_in <=  1'b0;	
			36: din_in <=  1'b0;	37: din_in <=  1'b0;	38: din_in <=  1'b0;	39: din_in <=  1'b0;	
			40: din_in <=  1'b0;	41: din_in <=  1'b0;	42: din_in <=  1'b0;	43: din_in <=  1'b0;	
			44: din_in <=  1'b0;	45: din_in <=  1'b0;	46: din_in <=  1'b0;	47: din_in <=  1'b0;	
			48: din_in <=  1'b0;	49: din_in <=  1'b0;	50: din_in <=  1'b0;	51: din_in <=  1'b0;	
			52: din_in <=  1'b0;	53: din_in <=  1'b0;	54: din_in <=  1'b0;	55: din_in <=  1'b0;	
			56: din_in <=  1'b0;	57: din_in <=  1'b0;	58: din_in <=  1'b0;	59: din_in <=  1'b0;	
			60: din_in <=  1'b0;	61: din_in <=  1'b0;	62: din_in <=  1'b0;	63: din_in <=  1'b0;	
			64: din_in <=  1'b0;	65: din_in <=  1'b0;	66: din_in <=  1'b0;	67: din_in <=  1'b0;	
			68: din_in <=  1'b0;	69: din_in <=  1'b0;	70: din_in <=  1'b0;	71: din_in <=  1'b0;	
			72: din_in <=  1'b0;	73: din_in <=  1'b0;	74: din_in <=  1'b0;	75: din_in <=  1'b0;	
			76: din_in <=  1'b0;	77: din_in <=  1'b0;	78: din_in <=  1'b0;	79: din_in <=  1'b0;	
			80: din_in <=  1'b0;	81: din_in <=  1'b0;	82: din_in <=  1'b0;	83: din_in <=  1'b0;	
			84: din_in <=  1'b0;	85: din_in <=  1'b0;	86: din_in <=  1'b0;	87: din_in <=  1'b0;	
			88: din_in <=  1'b0;	89: din_in <=  1'b0;	90: din_in <=  1'b0;	91: din_in <=  1'b0;	
			92: din_in <=  1'b0;	93: din_in <=  1'b0;	94: din_in <=  1'b0;	95: din_in <=  1'b0;	
			96: din_in <=  1'b0;	97: din_in <=  1'b0;	98: din_in <=  1'b0;	99: din_in <=  1'b0;	
			100: din_in <=  1'b0;	101: din_in <=  1'b0;	102: din_in <=  1'b0;	103: din_in <=  1'b0;	
			104: din_in <=  1'b0;	105: din_in <=  1'b0;	106: din_in <=  1'b0;	107: din_in <=  1'b0;	
			108: din_in <=  1'b0;	109: din_in <=  1'b0;	110: din_in <=  1'b0;	111: din_in <=  1'b0;	
			112: din_in <=  1'b0;	113: din_in <=  1'b0;	114: din_in <=  1'b0;	115: din_in <=  1'b0;	
			116: din_in <=  1'b0;	117: din_in <=  1'b0;	118: din_in <=  1'b0;	119: din_in <=  1'b0;	
			120: din_in <=  1'b0;	121: din_in <=  1'b0;	122: din_in <=  1'b0;	123: din_in <=  1'b0;	
			124: din_in <=  1'b1;	125: din_in <=  1'b0;	126: din_in <=  1'b0;	127: din_in <=  1'b0;	
			128: din_in <=  1'b1;	129: din_in <=  1'b1;	130: din_in <=  1'b0;	131: din_in <=  1'b1;	
			132: din_in <=  1'b1;	133: din_in <=  1'b1;	134: din_in <=  1'b1;	135: din_in <=  1'b0;	
			136: din_in <=  1'b1;	137: din_in <=  1'b1;	138: din_in <=  1'b1;	139: din_in <=  1'b1;	
			140: din_in <=  1'b0;	141: din_in <=  1'b1;	142: din_in <=  1'b1;	143: din_in <=  1'b1;	
			144: din_in <=  1'b1;	145: din_in <=  1'b0;	146: din_in <=  1'b1;	147: din_in <=  1'b1;	
			148: din_in <=  1'b1;	149: din_in <=  1'b1;	150: din_in <=  1'b0;	151: din_in <=  1'b1;	
			152: din_in <=  1'b1;	153: din_in <=  1'b1;	154: din_in <=  1'b1;	155: din_in <=  1'b0;	
			156: din_in <=  1'b0;	157: din_in <=  1'b0;	158: din_in <=  1'b0;	159: din_in <=  1'b0;	
			160: din_in <=  1'b0;	161: din_in <=  1'b1;	162: din_in <=  1'b1;	163: din_in <=  1'b1;	
			164: din_in <=  1'b1;	165: din_in <=  1'b0;	166: din_in <=  1'b0;	167: din_in <=  1'b0;	
			168: din_in <=  1'b0;	169: din_in <=  1'b0;	170: din_in <=  1'b0;	171: din_in <=  1'b1;	
			172: din_in <=  1'b1;	173: din_in <=  1'b1;	174: din_in <=  1'b1;	175: din_in <=  1'b0;	
			176: din_in <=  1'b0;	177: din_in <=  1'b0;	178: din_in <=  1'b0;	179: din_in <=  1'b0;	
			180: din_in <=  1'b0;	181: din_in <=  1'b1;	182: din_in <=  1'b1;	183: din_in <=  1'b1;	
			184: din_in <=  1'b1;	185: din_in <=  1'b0;	186: din_in <=  1'b0;	187: din_in <=  1'b0;	
			188: din_in <=  1'b0;	189: din_in <=  1'b0;	190: din_in <=  1'b0;	191: din_in <=  1'b1;	
			192: din_in <=  1'b1;	193: din_in <=  1'b1;	194: din_in <=  1'b1;	195: din_in <=  1'b0;	
			196: din_in <=  1'b0;	197: din_in <=  1'b0;	198: din_in <=  1'b0;	199: din_in <=  1'b0;	
			200: din_in <=  1'b0;	201: din_in <=  1'b1;	202: din_in <=  1'b1;	203: din_in <=  1'b1;	
			204: din_in <=  1'b1;	205: din_in <=  1'b0;	206: din_in <=  1'b0;	207: din_in <=  1'b0;	
			208: din_in <=  1'b0;	209: din_in <=  1'b0;	210: din_in <=  1'b0;	211: din_in <=  1'b1;	
			212: din_in <=  1'b1;	213: din_in <=  1'b1;	214: din_in <=  1'b1;	215: din_in <=  1'b0;	
			216: din_in <=  1'b0;	217: din_in <=  1'b0;	218: din_in <=  1'b0;	219: din_in <=  1'b0;	
			220: din_in <=  1'b0;	221: din_in <=  1'b1;	222: din_in <=  1'b1;	223: din_in <=  1'b1;	
			224: din_in <=  1'b1;	225: din_in <=  1'b0;	226: din_in <=  1'b0;	227: din_in <=  1'b0;	
			228: din_in <=  1'b0;	229: din_in <=  1'b0;	230: din_in <=  1'b0;	231: din_in <=  1'b1;	
			232: din_in <=  1'b1;	233: din_in <=  1'b1;	234: din_in <=  1'b1;	235: din_in <=  1'b0;	
			236: din_in <=  1'b1;	237: din_in <=  1'b1;	238: din_in <=  1'b1;	239: din_in <=  1'b1;	
			240: din_in <=  1'b0;	241: din_in <=  1'b1;	242: din_in <=  1'b1;	243: din_in <=  1'b1;	
			244: din_in <=  1'b1;	245: din_in <=  1'b1;	246: din_in <=  1'b0;	247: din_in <=  1'b1;	
			248: din_in <=  1'b1;	249: din_in <=  1'b1;	250: din_in <=  1'b1;	251: din_in <=  1'b0;	
			252: din_in <=  1'b1;	253: din_in <=  1'b1;	254: din_in <=  1'b1;	255: din_in <=  1'b1;	
			256: din_in <=  1'b0;	257: din_in <=  1'b1;	258: din_in <=  1'b1;	259: din_in <=  1'b1;	
			260: din_in <=  1'b1;	261: din_in <=  1'b0;	262: din_in <=  1'b1;	263: din_in <=  1'b1;	
			264: din_in <=  1'b1;	265: din_in <=  1'b1;	266: din_in <=  1'b0;	267: din_in <=  1'b1;	
			268: din_in <=  1'b1;	269: din_in <=  1'b1;	270: din_in <=  1'b1;	271: din_in <=  1'b0;	
			272: din_in <=  1'b1;	273: din_in <=  1'b1;	274: din_in <=  1'b1;	275: din_in <=  1'b1;	
			276: din_in <=  1'b1;	277: din_in <=  1'b0;	278: din_in <=  1'b1;	279: din_in <=  1'b1;	
			280: din_in <=  1'b1;	281: din_in <=  1'b1;	282: din_in <=  1'b0;	283: din_in <=  1'b1;	
			284: din_in <=  1'b1;	285: din_in <=  1'b1;	286: din_in <=  1'b1;	287: din_in <=  1'b0;	
			288: din_in <=  1'b1;	289: din_in <=  1'b1;	290: din_in <=  1'b1;	291: din_in <=  1'b1;	
			292: din_in <=  1'b1;	293: din_in <=  1'b0;	294: din_in <=  1'b1;	295: din_in <=  1'b1;	
			296: din_in <=  1'b1;	297: din_in <=  1'b1;	298: din_in <=  1'b0;	299: din_in <=  1'b1;	
			300: din_in <=  1'b1;	301: din_in <=  1'b1;	302: din_in <=  1'b1;	303: din_in <=  1'b1;	
			304: din_in <=  1'b0;	305: din_in <=  1'b1;	306: din_in <=  1'b1;	307: din_in <=  1'b1;	
			308: din_in <=  1'b1;	309: din_in <=  1'b0;	310: din_in <=  1'b1;	311: din_in <=  1'b1;	
			312: din_in <=  1'b1;	313: din_in <=  1'b1;	314: din_in <=  1'b0;	315: din_in <=  1'b1;	
			316: din_in <=  1'b1;	317: din_in <=  1'b1;	318: din_in <=  1'b1;	319: din_in <=  1'b0;	
			320: din_in <=  1'b1;	321: din_in <=  1'b1;	322: din_in <=  1'b1;	323: din_in <=  1'b1;	
			324: din_in <=  1'b0;	325: din_in <=  1'b1;	326: din_in <=  1'b1;	327: din_in <=  1'b0;	
			328: din_in <=  1'b0;	329: din_in <=  1'b1;	330: din_in <=  1'b0;	331: din_in <=  1'b0;	
			332: din_in <=  1'b1;	333: din_in <=  1'b0;	334: din_in <=  1'b0;	335: din_in <=  1'b1;	
			336: din_in <=  1'b1;	337: din_in <=  1'b1;	338: din_in <=  1'b1;	339: din_in <=  1'b0;	
			340: din_in <=  1'b1;	341: din_in <=  1'b1;	342: din_in <=  1'b1;	343: din_in <=  1'b1;	
			344: din_in <=  1'b0;	345: din_in <=  1'b0;	346: din_in <=  1'b1;	347: din_in <=  1'b1;	
			348: din_in <=  1'b1;	349: din_in <=  1'b1;	350: din_in <=  1'b0;	351: din_in <=  1'b1;	
			352: din_in <=  1'b1;	353: din_in <=  1'b1;	354: din_in <=  1'b1;	355: din_in <=  1'b0;	
			356: din_in <=  1'b0;	357: din_in <=  1'b1;	358: din_in <=  1'b1;	359: din_in <=  1'b1;	
			360: din_in <=  1'b1;	361: din_in <=  1'b0;	362: din_in <=  1'b1;	363: din_in <=  1'b1;	
			364: din_in <=  1'b1;	365: din_in <=  1'b1;	366: din_in <=  1'b0;	367: din_in <=  1'b1;	
			368: din_in <=  1'b1;	369: din_in <=  1'b1;	370: din_in <=  1'b1;	371: din_in <=  1'b0;	
			372: din_in <=  1'b1;	373: din_in <=  1'b1;	374: din_in <=  1'b1;	375: din_in <=  1'b1;	
			376: din_in <=  1'b0;	377: din_in <=  1'b1;	378: din_in <=  1'b1;	379: din_in <=  1'b1;	
			380: din_in <=  1'b1;	381: din_in <=  1'b0;	382: din_in <=  1'b1;	383: din_in <=  1'b1;	
			384: din_in <=  1'b1;	385: din_in <=  1'b1;	386: din_in <=  1'b0;	387: din_in <=  1'b1;	
			388: din_in <=  1'b1;	389: din_in <=  1'b1;	390: din_in <=  1'b1;	391: din_in <=  1'b0;	
			392: din_in <=  1'b1;	393: din_in <=  1'b1;	394: din_in <=  1'b1;	395: din_in <=  1'b1;	
			396: din_in <=  1'b0;	397: din_in <=  1'b0;	398: din_in <=  1'b1;	399: din_in <=  1'b1;	
			400: din_in <=  1'b1;	401: din_in <=  1'b1;	402: din_in <=  1'b0;	403: din_in <=  1'b1;	
			404: din_in <=  1'b1;	405: din_in <=  1'b1;	406: din_in <=  1'b1;	407: din_in <=  1'b0;	
			408: din_in <=  1'b0;	409: din_in <=  1'b1;	410: din_in <=  1'b1;	411: din_in <=  1'b1;	
			412: din_in <=  1'b1;	413: din_in <=  1'b0;	414: din_in <=  1'b0;	415: din_in <=  1'b0;	
			416: din_in <=  1'b0;	417: din_in <=  1'b0;	418: din_in <=  1'b0;	419: din_in <=  1'b1;	
			420: din_in <=  1'b1;	421: din_in <=  1'b1;	422: din_in <=  1'b1;	423: din_in <=  1'b0;	
			424: din_in <=  1'b0;	425: din_in <=  1'b0;	426: din_in <=  1'b0;	427: din_in <=  1'b0;	
			428: din_in <=  1'b0;	429: din_in <=  1'b1;	430: din_in <=  1'b1;	431: din_in <=  1'b1;	
			432: din_in <=  1'b1;	433: din_in <=  1'b0;	434: din_in <=  1'b0;	435: din_in <=  1'b0;	
			436: din_in <=  1'b0;	437: din_in <=  1'b0;	438: din_in <=  1'b0;	439: din_in <=  1'b1;	
			440: din_in <=  1'b1;	441: din_in <=  1'b1;	442: din_in <=  1'b1;	443: din_in <=  1'b0;	
			444: din_in <=  1'b0;	445: din_in <=  1'b0;	446: din_in <=  1'b0;	447: din_in <=  1'b0;	
			448: din_in <=  1'b0;	449: din_in <=  1'b0;	450: din_in <=  1'b1;	
			451: din_in <=  1'b0;	452: din_in <=  1'b0;
			default: din_in <=  1'b0;
			endcase 		
end // End of Always

always @ (negedge clk_in)// or posedge dump)
begin 	

		if (counter == total_bits)
			clk_strobe <= 1'b1;
		else
			clk_strobe <= 1'b0;

end // End of Always

always @ (negedge clk_in)// or posedge dump)
begin 	

	if(out_en == 1'b1)
	begin
		if (counter == total_bits+1)
		begin
			counter <= 10'b0000_0000_00;
			cnt_0 <= 1'b1;
		end
		else
		begin
			counter <= counter + 1'b1; 
			cnt_0 <= 1'b0;
		end
	end

	else
		counter <= 10'b0000_0000_00;
end // End of Always

endmodule // End of Module counter

