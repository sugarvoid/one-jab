GDPC                	                                                                         T   res://.godot/exported/133200997/export-36a25e342948d0ceacc500772b5412b3-player.scn  �N      �      ����T�H4f$=��8    P   res://.godot/exported/133200997/export-609f762188a68253d349ec58c4f3a8d3-game.scn@      '      ��\����.E�4��    X   res://.godot/exported/133200997/export-c878bd6ecbe2d6aff7df88166053907c-punching_bag.scn@F      ,      HԂ@؄�H����:�    ,   res://.godot/global_script_class_cache.cfg  �R             ��Р�8���8~$}P�    L   res://.godot/imported/PICO-8.ttf-c913a0797c66d7b684e64670ce9a00c5.fontdata  �2      o      Z[���$ [������    L   res://.godot/imported/floor_spot.png-710fe6d724960a782ad3e9a56f46e453.ctex          �       �X��cEu�|����_    D   res://.godot/imported/icon.png-487276ed1e3a0c39cad0279d744ee560.ctexp      �      �,�/v�!�2x[Z5    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�      �      �Yz=������������    L   res://.godot/imported/monogram.ttf-251ba65795ff272578544793442aad20.fontdata�      N      �Z�7]xw�y�    H   res://.godot/imported/player.png-2dd0af52de4b213777cd8c9df94c0978.ctex  �B      �       ��4�:�
�yKk��     H   res://.godot/imported/punchbag.png-802ff422b13210d44318df350bb873d1.ctex`D            �vkWB��*�����       res://.godot/uid_cache.bin  �V      '      љA�����G�_ߴ��       res://PICO-8.ttf.import  B      �       B`���ش��

ȇ�       res://floor_spot.png.import �       �       ��8洄EkI�.6~       res://game.gd   `      �      �i+<�D���#��6)�       res://game.tscn.remap   pQ      a       �?��� �ު��y�       res://icon.png.import         �       ��y��q1�}Dh�d�       res://icon.svg  �R      �      C��=U���^Qu��U3       res://icon.svg.import   �      �       k1�r�b��٣��3       res://monogram.ttf.import   �1      �       ���jb�Y�m��b       res://player.png.import �C      �       ��6�&Q�T��-4�        res://player.tscn.remap PR      c       ������T�?�L���       res://project.binary�W      `      �2B=5�j�^�����8'       res://punchbag.png.import   pE      �       ;Հި�G�G�pO�       res://punching_bag.gd   pM      '      ������<���49�Vؖ        res://punching_bag.tscn.remap   �Q      i       U5�>E���A��.
ޗ                GST2            ����                        V   RIFFN   WEBPVP8LA   /� H�k�@���l����Z@P��h�S�l\ɧ��5SQ!�� ���SR_�gߜ   [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://c5mg85mfs4atw"
path="res://.godot/imported/floor_spot.png-710fe6d724960a782ad3e9a56f46e453.ctex"
metadata={
"vram_texture": false
}
          extends Node2D

var game_state: int = 0

const slots: Array[int] = [
	8,
	28,
	48,
	68,
	88,
	108
]

func _ready():
	switch_screen(0)
	

func _process(delta):
	pass


func switch_screen(new_screen: int):
	self.game_state = new_screen
	match new_screen:
		0:
			$PlayScreen.hide()
			$GameOver.hide()
			$StartScreen.show() 
		1:
			$PlayScreen.show()
			$StartScreen.hide()
		2:
			$PlayScreen.hide()


func _input(event):
	match game_state:
		0:
			if event.is_action_pressed("move") or event.is_action_pressed("poke"):
				self.switch_screen(1)
		1:
			if event.is_action_pressed("ui_accept"):
				$PlayScreen/PunchingBag/AnimatedSprite2D.play("hit")
		2: 
			pass
	
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	
   RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://game.gd ��������	   FontFile    res://monogram.ttf ۀ����O
   Texture2D    res://floor_spot.png �Q
�>��_   PackedScene    res://punching_bag.tscn �\��=.'   PackedScene    res://player.tscn t1��2-q      local://PackedScene_pydhv �         PackedScene          	         names "          Game    script    Node2D    StartScreen    visible 
   ColorRect    offset_right    offset_bottom    color    Label4    offset_left    offset_top    theme_override_fonts/font $   theme_override_font_sizes/font_size    text    Label    Label8    Label5    PlayScreen    ColorRect2 	   Sprite2D 	   position    texture 
   Sprite2D2 
   Sprite2D3 
   Sprite2D4 
   Sprite2D5 
   Sprite2D6    PunchingBag    Player    Label9 	   GameOver    	   variants    1                         C     C   ���>���;���>  �?     �A     @A     �B     ,B                   	   One Poke      �A     �B     �B      [X]/[C] TO START       �     �B      �     �B      Test      ��     �B     C   ��T?��?���>  �?     ��   �l>r�>���>  �?
     `A  �B         
     B  �B
     XB  �B
     �B  �B
     �B  �B
     �B  �B         
     `A  �B         
     B  �B     �?     �B     DB     �B   	   [X] Move      �B     �B     �B     C   	   [C] Poke       [Z]/[X] TO START       node_count             nodes       ��������       ����                            ����                          ����                                   	   ����   
                           	      
                          ����   
                           	                          ����   
                           	                           ����                     ����   
                                               ����   
                                               ����                                ����                                ����                                ����                                ����                                 ����      !                    ���   "         #              ���   $         %                    ����   
   &      '      (      )      	      *                    ����   
   +      ,      -      .      	      /                     ����                          ����   
                           	      0             conn_count              conns               node_paths              editable_instances              version             RSRC         GST2   @   @      ����               @ @        `  RIFFX  WEBPVP8LK  /?�/@�m���fzfgC�mS���\��6���nqA������5`G�d5�4��H2 �ꟈ].���������3rEL E{k_1�Y{�W��J�$T&l�Z�����PB�>%��h��#[P��(=�f�~�E�G �s�~K
J���QUڈ�����Ua��N�6��\ �Ǉ���a" ַ%��zf�R���M 
�������|��Q��9f��l=�RغlY̒<��ۑ�*c7S�n'S���N��s�:�J�l��傮�m`�vA��*j�N��n����MU��;P�3���z]]ʆG�|�6ґ_㐥7�         [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://c8rdk0hgwac5l"
path="res://.godot/imported/icon.png-487276ed1e3a0c39cad0279d744ee560.ctex"
metadata={
"vram_texture": false
}
                GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح����mow�*��f�&��Cp�ȑD_��ٮ}�)� C+���UE��tlp�V/<p��ҕ�ig���E�W�����Sթ�� ӗ�A~@2�E�G"���~ ��5tQ#�+�@.ݡ�i۳�3�5�l��^c��=�x�Н&rA��a�lN��TgK㼧�)݉J�N���I�9��R���$`��[���=i�QgK�4c��%�*�D#I-�<�)&a��J�� ���d+�-Ֆ
��Ζ���Ut��(Q�h:�K��xZ�-��b��ٞ%+�]�p�yFV�F'����kd�^���:[Z��/��ʡy�����EJo�񷰼s�ɿ�A���N�O��Y��D��8�c)���TZ6�7m�A��\oE�hZ�{YJ�)u\a{W��>�?�]���+T�<o�{dU�`��5�Hf1�ۗ�j�b�2�,%85�G.�A�J�"���i��e)!	�Z؊U�u�X��j�c�_�r�`֩A�O��X5��F+YNL��A��ƩƗp��ױب���>J�[a|	�J��;�ʴb���F�^�PT�s�)+Xe)qL^wS�`�)%��9�x��bZ��y
Y4�F����$G�$�Rz����[���lu�ie)qN��K�<)�:�,�=�ۼ�R����x��5�'+X�OV�<���F[�g=w[-�A�����v����$+��Ҳ�i����*���	�e͙�Y���:5FM{6�����d)锵Z�*ʹ�v�U+�9�\���������P�e-��Eb)j�y��RwJ�6��Mrd\�pyYJ���t�mMO�'a8�R4��̍ﾒX��R�Vsb|q�id)	�ݛ��GR��$p�����Y��$r�J��^hi�̃�ūu'2+��s�rp�&��U��Pf��+�7�:w��|��EUe�`����$G�C�q�ō&1ŎG�s� Dq�Q�{�p��x���|��S%��<
\�n���9�X�_�y���6]���մ�Ŝt�q�<�RW����A �y��ػ����������p�7�l���?�:������*.ո;i��5�	 Ύ�ș`D*�JZA����V^���%�~������1�#�a'a*�;Qa�y�b��[��'[�"a���H�$��4� ���	j�ô7�xS�@�W�@ ��DF"���X����4g��'4��F�@ ����ܿ� ���e�~�U�T#�x��)vr#�Q��?���2��]i�{8>9^[�� �4�2{�F'&����|���|�.�?��Ȩ"�� 3Tp��93/Dp>ϙ�@�B�\���E��#��YA 7 `�2"���%�c�YM: ��S���"�+ P�9=+D�%�i �3� �G�vs�D ?&"� !�3nEФ��?Q��@D �Z4�]�~D �������6�	q�\.[[7����!��P�=��J��H�*]_��q�s��s��V�=w�� ��9wr��(Z����)'�IH����t�'0��y�luG�9@��UDV�W ��0ݙe)i e��.�� ����<����	�}m֛�������L ,6�  �x����~Tg����&c�U��` ���iڛu����<���?" �-��s[�!}����W�_�J���f����+^*����n�;�SSyp��c��6��e�G���;3Z�A�3�t��i�9b�Pg�����^����t����x��)O��Q�My95�G���;w9�n��$�z[������<w�#�)+��"������" U~}����O��[��|��]q;�lzt�;��Ȱ:��7�������E��*��oh�z���N<_�>���>>��|O�׷_L��/������զ9̳���{���z~����Ŀ?� �.݌��?�N����|��ZgO�o�����9��!�
Ƽ�}S߫˓���:����q�;i��i�]�t� G��Q0�_î!�w��?-��0_�|��nk�S�0l�>=]�e9�G��v��J[=Y9b�3�mE�X�X�-A��fV�2K�jS0"��2!��7��؀�3���3�\�+2�Z`��T	�hI-��N�2���A��M�@�jl����	���5�a�Y�6-o���������x}�}t��Zgs>1)���mQ?����vbZR����m���C��C�{�3o��=}b"/�|���o��?_^�_�+��,���5�U��� 4��]>	@Cl5���w��_$�c��V��sr*5 5��I��9��
�hJV�!�jk�A�=ٞ7���9<T�gť�o�٣����������l��Y�:���}�G�R}Ο����������r!Nϊ�C�;m7�dg����Ez���S%��8��)2Kͪ�6̰�5�/Ӥ�ag�1���,9Pu�]o�Q��{��;�J?<�Yo^_��~��.�>�����]����>߿Y�_�,�U_��o�~��[?n�=��Wg����>���������}y��N�m	n���Kro�䨯rJ���.u�e���-K��䐖��Y�['��N��p������r�Εܪ�x]���j1=^�wʩ4�,���!�&;ج��j�e��EcL���b�_��E�ϕ�u�$�Y��Lj��*���٢Z�y�F��m�p�
�Rw�����,Y�/q��h�M!���,V� �g��Y�J��
.��e�h#�m�d���Y�h�������k�c�q��ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[          [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://dufxcmeq8oppq"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
                RSCC      g-  �  �  t  (�/�` U? za�H�q���e���%�d)i�		/
H*�����\��Z�u�dK�u��ҋC�,��De�6�������Md
.l�(����,�M@���{[+�<8�}��e wυ��j��v�<���x�����0�[�v�>�t�cy�<޽v��nߺ�Q�����\���⵷�ژ+��p?��]n�m����¾5��8*^o��+�G�^v��zq���ַn���q�[{�������e��Vv����n�6�����Za��y O�C�k�ٷ%��c���6f[�m��?{,d��6�n��w������^\��6�.����/��ݼx���ey��n��	������D/�'�ݖI~a���������X�h��%��x�&6���u���0�TU��~N�����Ɠ7�]�O�������F�F�O5]_]���vpUCxT�����R㯥FU�E;���,�fT jv�? ��D�9��X�O��2F�k��A��Y.�b�rʟ�ԋ����H.-(9D���nC�D����@��������_��s�/RT,
c�W���q�6��פ+����!��Կ	8D=�t'F�OR�#��3iȰA迖�����(��f��|ZQ���܆S��v��&�Z�C^��]�����@�����p�^'��ɬ�H�� Toz����|n>��Z��Y���Gn>�SKU+V�#7/[SK��(�:y��H���I�ӄ���<0�*��G�јhC�Z�Y�Y�Y�i�3{#�"C"�!C!s +eibWbIbr�C�(V�����x�`��`.X�ח����5���%��������u��j9i�h�h-h�%�e����ce`�XkVT+%�+��7e�2H�+�J���R
�D� ��8#�Hd�1^e�]��h*��~�	���5�rgqu��M���F�{�UF/\�`�BE
'L� 1BD<tఁIC,�(얔&H����B@��4`�[�����9t�0P
*@` � 3� ��L��\-֪$�Y�2n�����c�TJ�\�co�*��c���m6�d�,��9�П�?kT2s��F@���<*��A�:�8�s�d����4�O@�t4�q̙hү;�-���t����
�?*�e�D����@��xbQյ�g4=o&�&��wIAR��'Y��Վ4�ԇ��%�3��|=���$��RT�N]�9�;�T�L��78N��Z��Q�L4I]C��F��}��7ϔ4���9S+�Z)�9����v��<MT�N3=�M��4��}֪VU�Z%��s����u�Vչ���g�)��<Q}�
;R#U�R�11SfHDDDD�$�p��0F����-G�����$IA){�A�r/�L�K�^����3qON��of�EPu�cP����~�^e�j6F��g��'���{f V aN�X�^�ǽ4q��w�2V�C��b�� ۷3�݈ѿ�9u�P�'����\��M�N������|��=�k˺'�C�`m�ܘ�����Uv������8����d�{/ܛ5%yv���U��]��Ҹ�#����9z7�Вh��4�dJ������xh2P��_\��Z��ϧ�>�	'䍙r�`o���%U1�w��q?�+w;���E�{	�9 ;��mO�uTf���a�/K��i�;��-�Qau���0��qf>���L��z����*E#Z��>��/N#���P�7�l[�F�ո������@Uv:��-�f>�ׯʳ����s�@���G��T)��h�89]e���g�_�N2V�Zh����[�/�m�=l�!������H�=IK*�=D�Z�*s�!� ���uRO�?�V�9
��fA����B�z<-�j�2��8�z�,����������A?�#Yp�7��s��5��Y.PXT��ٱ����t� ��t�qmz���/����x@��CE��������r�OG��j��kC�DIK�pG�4%uI�Y�@��_��"�#���\��������(�/�` �% 6�g&�%I�����������/D����'M�mo�ܤm�o����)X ] ` ��N�'9�76��5�2.d�k�q�E��������p��K��4�?�w���g;^Vu����X�w?Ѯ�@.h��´ؐq.��O���F�L�R/S��������3N�u�.�>�CT�e����R\d��r%+H4E�L[4Ŕ���&Ŧ��(Yפ=��r��qϥ�i���1���'<������'G>�e]��=����l᝴��(��k�p�<�S�/�^�IʘL[Vl�Њiy�T$����L�ʊV���z��"mq������`��n(\;4	"��\J	\I���i�,[��´�m���-#�L��]�$�x�)�R���y������|ת��h�?�G�c��)�
GM0��x���"IR���")���C5F�T���$I��13��?'FH�Y�b@������157fF|� �-� ���U�>�8� %�Rx��b+o|��l��opf�7��<�D�L�3�l��v���
�U�8��0E2'[+��R`��爛�Ƒx��N~i�p$JK/�Rޕ��4\�Sy~ߕ�g�������^*��4 ����)y�������y_+���
����|�ϋ\��hD�g3;�f��I}ZS�&��[��Dl� �5��rpa�X��Y��6y�k�[9"-�~>Eh�:�1�/O�s�M��~�����R2����Ɉ�enrY�c��_�T��1��۰�N~��qg���a�名�M�,$~��.�9 �t�f�����P�MV�iWX2iR��bƯ����7X���p�q��MRԵI�yV�8�܏�6�U��R*�v�6C�!��Ft;j�R�,({���T ��s.7nY�K?��r[h6I<nI�țm�w�ۀ(zc�����Y�g�ˀ1�����j�~�<���5�m�~>�r%j�Ҝ'�q	���>הu�����x�(z��l�A�H�R�{XO|�K�696fz=l;�ҹ��>f�2�y�>.^�e�~
Lsf+��,B�j�t���q��uW�L�m��4�h��W.��	�l�� 4��Y��"[���4��ξ�Ƞ]o@�m�8>��X���ap��ag�|,�ê[�9�P�4š}�`h�zD��[����m�s��w�z�b��B����s��l'�U(�/�`gU+ ��G�'�@	�82�a�"�4��Ĩ��=`�'fL����`+&#��_B+��EP9�\0��4�o�?Z[��l�� � � cAq�d.��&�[��G�2����cW���+�B�]�M�)���g��
�!R�iXWk�����.jq�ތ�X'��߂A��}`\�LE�Fo���|��(�㖒�{1mJ��&�ML����y��{3m�:3o7Z�&)͟�����'�+�z���j��)��Ө�KIZg>�S��Xaҋ���Bf�)i�)p��3Ө�]��7�n��
���#p�]�4k��K�V=�\-vы��~�����6��)��Q�u�BI+�i4�����"���P5U����)3��L�nwz��I�Ն�9�u�$���e>���~��v�V�֙��)�4xn�Ԩg.�6�ep�0��<�/��M����)�\��hѡ���7��GqWc�q(׫����y�\�6ss�v��3k�{�Z4X4��S��z�|�2��Ư]���W����j�h�Z<��5�Y�f���@��qk׭ynrˢ"���,�ܘ�U��-��Kَ���EKn9DdRH� q �9����/���wF��_&#��$:��#I�<1��6��|P�rG_>@2	V�zc�q7�ǵ\@#Ӳ�ʪlʢliI;Zц6[ly��/��D�q��W�1��]�b�X�)F1�'6q�I<b��;�����5�a_����;g
{O�g	Gx5����8��3x{�
N�j�5�q=BT2"IQ��r��<�,33""Ң$�a�<�FŁ}b��E�*MU�X�f0�p��SEgپ�֪����w������9]w��QT��$�TFV�Т�
p=%��*�h>��o���z)�V�tI�QE�<UU�@AE�x @@  :s3+�/�m4Y�Ntt�*��M;�!e���_oRI6|�GeV�:sL�Tg������UA0�HQZ*MF�8��
Q��B7<D"�&Sx�'�f�bVv�w!{��T��7Deg|U�	ш�ߔ�΁�.�!��=O?6O�[ЇNٚ�b��L�k�N�?72�XS	X��	���<q��;!�_)59K`d_A�`'jV�k8E��}s�����H�a�IC�+1���?*����e��B���B�w��}���=7����N�+hiY��D�����>�\�Q�)�C8v��/��������n�&b��"����~�y�>�� �b="�Q4(�Uٺ���\ŔFc�r��P��J��y�W�~~i���ۤ��q�P�[&gf,��� �1 ����O(� ��]�E]��l�7��'��3�~�[���y�o��(��$�PT��/z61q�]�?^��<���[�RSCC  [remap]

importer="font_data_dynamic"
type="FontFile"
uid="uid://cnvt8vlhoyj1d"
path="res://.godot/imported/monogram.ttf-251ba65795ff272578544793442aad20.fontdata"
            RSCC      f0  �  �  Y  N   (�/�` }5 �]�D��5 ��!g��!6�^J8 ~�`t�HD�ϖ{GG�5���� k9.]���$  1�fP�M��� *Ws�u��h�O����%0H9ϲ>zD9�jt����N�r���6�8od��v�������F�ם���0vAڟ����F���G���~s���,����״-��w���z^�G]��7~�GkK�8�X9������GApv[����'���:�P��QY�wۥ��\��RS/v�_���qVo��?�c8��~�S� u��wr��6Y�7[������ۨ٫ys��F7�eG*�	�
'���W�.h�~���7��?���`'O8'�:� ��711 �l3��5�e��� 6-�f���yG��		�J�M�V��\j�tz���˄��)��K'����%))��L ��@���?3�T�2:�&��mh�棠>42�����IR��h~EJ��/)�DJ�:�� <ݯ��1}��y&�:��H�ѸI;�@�a?��h�<��J~�ǃp~�?��kI0�GCV�B~Z�9�����rGU�2_�a7 �Ԉ�#����S�z"����ܝ�*��Ӆ1�E?{�e!8�eɣ	��O^�֐��B�C��j�͗骬�l���賁>1V6��[�2�hU#h7jT� I��Io�M��g7Ц�/V��#h��
Iz��IE�V@+��f�1A[C۩`0X��n����K�&�\��/h[Y"��;��LHo�D2��$*�-+���Qn�WN9֕�G���"�!��^�-��r�|T���� �&���6kH1Z!5	�$���z��	<����Z'�i��S�8\L�����0��1a�&���(��OhJ;�R���6���R_�Q�p���w�: �TF�)�@�I��Eѐ���A]����E,b�0�������=cv��� ����d��=�y���,��Zܮ��F׽������b��ݠ������9�=�`9��:̻��5�-w �O5~[gg�8���������>���E��F�t�)����j�?��Cn��}�->�~��b��b��^1�^�a9}[�^gmߞ�X~�v]�nZ���y����%b����� I��1H����Y�4L)����E%�Ȳ��O,2UѾIZ	qwt��w�v)Q�y-���N��M@���^�rǚ�f�I�e���k��̷����f'��0������2W��Q|^�����K��(r%��&o��Jp0־��K��5�U�$�h]�8��O�Ʒ��N慟�5+��_�c m���-V�;tL8Ɂ7�bH	ԋ���יȴW�;�,������G7�l_�0���������,*���hQ�L����,�:��������b"�q�����5ᄶ�����ng������nXq|6��y�X�J��"Z�㡍�i�k���~����ㄜ���Tw[�^�~ێc�����A뷠"s����kX�p5>���mi��G�#�i����G���a���R��
��Q�.=Q�-���X�v������VD�7���a&�:6 (�	 �v̷gρ�|���j�֭��bGp�����|11j���L�z?��"��S`~��"�˳�Ё"�o"q9D����9J:��"�V�iN�у#%�%��@�2���	(�/�`  �3+��i֎|g��wZA���~���R�h����X�z$F�������% & & �7,�����
�p0�?P�H~�� #�L�[�}s�K5RY_{�Y�G.\��~��&�k���1BŰ�I��k�I��'v�Í&�b��\Y��Z�GәI"���`l`��y�I�T�X7!��[�(�X��ĢMY��uݺ��$�
����^IRPP(5��($��=@4$�gT9�Ȉ�����))�&��F	m�w��7A�^�7~�B�����6@�t�am�2l��:,����9�F>�g�1�{�+�9�+F߃_H��o��\��t�y�h�|Ԧ�O}����Ie���v��Y���(l[��t��I�F};����m�3y�܊:`�7���b���V�%~��b	�����@���LY����y���<u�D{�l-�E����9���,������^N
����wQ�Y�86�8�Vˣ-���$�_@�j���t���j��z�~O���HW�e���B�ۑ[�	i=r�߇�\ռ�.WAwk@�����;�_���"y��">�rô0�E��?%�d��a�"R�G�y܃�;�H����t�ٳH?v�l�C�%�2밅Ǜ+_�\Σ!>o���W�Qj~��� çڋs��$� ���2Ά�,w� �Wb����5��]��d�s�������ɱ@���ȫF���f�1��M\O���R����us�3�d����s����O\�2�Qi��:xn��<\R�|�-;��BQy��JX�{�7c�z�d�����'��*�[0����8�O./���r������p�J��4dM�v����b���� :I2� ����j�G4��#��
~�Q��{�l�z�S0�Mω.R��o`(��g4�QR9լ���hP5��S8���N3�.����W{ω�v��Dr��H��=��4Lf����;U�c>��#�}�����T�(�/�` }" ��e;0��9���t	mHk��R����SM$5������M��� o�ZT��>P�����m
Z X N +���m�ȵiNP�W�|�M��^��}�씵b��Ce�` r�h�Wۧ׭GY�Doǩݝ<��\���jk�V�OeM��m�F�f��U[+�z-z�lo�,���Y�v�6H�$;${#;@v�e���/X��a�d����V��Q�Ty���$���<ѻp"��`�S��mB��K�z�e��8��	�&.�����Y@g�8'��lA��#�;6�6�ttgt�h��l���F�]� � �9$�F�N�n�7���<,�RPCp��ӵ��1c�'������)��#�.�\<b1��%�M*�PqW1별�>[>g���#�5x�l��y&��#�e��Z��� 5�v�!� �z�S DhIR"""""IIQQ!�� �6)��W*8��e�\+��&�Uy����&y緹�T�$�oC�>+��� �i��˞������`�H�[f4U�G�������e�5f�a�����a��,�;���k_Kf��㻠��b�-�W;���h�X(�漈�#�RU��E�E��(v���%?�~���������/y���֐�$���}0��  /�{�`��tX�/m�PGv������|ő �>(�/�	'�z3��aI��$���^�@������7<hC��i��iI�������v[�<R��bq�g>��Ɉ�9�������{�U��j�͕�瘼���#��׃���Pp��_k�ܛ�x<�?�����?�k�t��I��M|.���~���{���FzČ�2T<���:Ɨ�c%�w<�Rt� �Z���}S6lj�#���zdm�V�ȃ�ß�>Ͻ�čl���(�
� n$=ij�ʦ
��N'��yl��7}c���/���8�-�VǗ�7��`�O�!���M��Ϥ����<���ؑ~X�M�Y`��׷L�読��������I����\�;ԇ��ɨF�꿗׌�M�B�Nϯ���p8�m�uM}��=2���,Z�jɻ��N��o@�����e�(�/� f- 4r              �A   ��!L?"�?#   
$      RSRC ` ��� e�� &RSCC [remap]

importer="font_data_dynamic"
type="FontFile"
uid="uid://cm7ok0phwocur"
path="res://.godot/imported/PICO-8.ttf-c913a0797c66d7b684e64670ce9a00c5.fontdata"
              GST2             ����                         �   RIFF�   WEBPVP8L�   /�/@�mT�}�_�4�m����6u�/ (����W�6�F��޻#P+�9M`�j �����F!��`��C��TQ��G�A��9Y<���{_@�x���Nq�y�$Bp�4�C|̄=             [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://b8l4v71udi62w"
path="res://.godot/imported/player.png-2dd0af52de4b213777cd8c9df94c0978.ctex"
metadata={
"vram_texture": false
}
              GST2   @          ����               @          �   RIFF�   WEBPVP8L�   /?�7@�mS�ܟ��6�O�mS���l�?Z �oT�pU�v�\$8 p�X���ps�y���?�mi�V��{�ZI��wLl�H�,�wL<#v����1�j5�1�b�V�&������\��q��]�	I,�����p�i�.��������9�               [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://ctcqwbxebrbuk"
path="res://.godot/imported/punchbag.png-802ff422b13210d44318df350bb873d1.ctex"
metadata={
"vram_texture": false
}
            RSRC                    PackedScene            ��������                                            	      resource_local_to_scene    resource_name    atlas    region    margin    filter_clip    script    animations 	   _bundled       Script    res://punching_bag.gd ��������
   Texture2D    res://punchbag.png b�韧�T      local://AtlasTexture_8awx5 <         local://AtlasTexture_y43qc �         local://AtlasTexture_1px8b �         local://AtlasTexture_ohmmd          local://SpriteFrames_tms84 P         local://PackedScene_wy20f J         AtlasTexture                                �A   B         AtlasTexture                        �A      �A   B         AtlasTexture                         B      �A   B         AtlasTexture                        @B      �A   B         SpriteFrames                         name ,      hit       speed      pA      loop              frames                   texture              	   duration      �?            texture             	   duration      �?            texture             	   duration      �?            texture             	   duration      �?            texture             	   duration      �?            texture              	   duration      �?         PackedScene          	         names "         PunchingBag    script    Node2D    AnimatedSprite2D    sprite_frames 
   animation    	   variants                          ,      hit       node_count             nodes        ��������       ����                            ����                         conn_count              conns               node_paths              editable_instances              version             RSRC    extends Node2D

var slot: int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func move_to_slot(slot: int):
	pass
         RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script    
   Texture2D    res://player.png YY�?�A      local://PackedScene_uslit          PackedScene          	         names "         Player    metadata/_edit_group_    Node2D 	   Sprite2D    texture    	   variants                             node_count             nodes        ��������       ����                            ����                   conn_count              conns               node_paths              editable_instances              version             RSRC             [remap]

path="res://.godot/exported/133200997/export-609f762188a68253d349ec58c4f3a8d3-game.scn"
               [remap]

path="res://.godot/exported/133200997/export-c878bd6ecbe2d6aff7df88166053907c-punching_bag.scn"
       [remap]

path="res://.godot/exported/133200997/export-36a25e342948d0ceacc500772b5412b3-player.scn"
             list=Array[Dictionary]([])
     <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
          
   �Ô��n   res://game.tscnJ�*��v   res://icon.svgۀ����O   res://monogram.ttf���`��N   res://PICO-8.ttf�Q
�>��_   res://floor_spot.pngb�韧�T   res://punchbag.pngo-M#���b   res://icon.png�\��=.'   res://punching_bag.tscnYY�?�A   res://player.pngt1��2-q   res://player.tscn         ECFG      application/config/name         One Poke   application/run/main_scene         res://game.tscn    application/config/features(   "         4.2    GL Compatibility       application/config/icon         res://icon.svg  "   display/window/size/viewport_width      �   #   display/window/size/viewport_height      �   )   display/window/size/window_width_override      �  *   display/window/size/window_height_override      �     display/window/stretch/mode         viewport
   input/move�              events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   X   	   key_label             unicode    x      echo          script            deadzone      ?
   input/poke�              events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   C   	   key_label             unicode    c      echo          script            deadzone      ?9   rendering/textures/canvas_textures/default_texture_filter          #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility