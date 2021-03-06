#!bin/bash

export CUDA_VISIBLE_DEVICES=0

# Scaling the entire scene
python src/run_perturb.py \
--image_path testing/kitti_semantic_test_vehicle_image.txt \
--n_height 192 \
--n_width 640 \
--n_channel 3 \
--output_norm 0.02 \
--n_step 500 \
--learning_rates 5.0 1.0 \
--learning_schedule 400 \
--depth_method packnet \
--depth_transform_func multiply \
--depth_transform_value 1.10 \
--mask_constraint none \
--checkpoint_path perturbations/packnet/all_mult110_norm002_lr5e0_1e0 \
--depth_model_restore_path0 pretrained_models/packnet/velsup_csk/PackNet01_MR_velsup_CStoK.ckpt \
--device gpu

# Symmetrically flipping the scene
python src/run_perturb.py \
--image_path testing/kitti_semantic_test_vehicle_image.txt \
--n_height 192 \
--n_width 640 \
--n_channel 3 \
--output_norm 0.02 \
--n_step 500 \
--learning_rates 5.0 1.0 \
--learning_schedule 400 \
--depth_method packnet \
--depth_transform_func flip_horizontal \
--depth_transform_value 0.00 \
--mask_constraint none \
--checkpoint_path perturbations/packnet/all_fliph_norm002_lr5e0_1e0 \
--depth_model_restore_path0 pretrained_models/packnet/velsup_csk/PackNet01_MR_velsup_CStoK.ckpt \
--device gpu

python src/run_perturb.py \
--image_path testing/kitti_semantic_test_vehicle_image.txt \
--n_height 192 \
--n_width 640 \
--n_channel 3 \
--output_norm 0.02 \
--n_step 500 \
--learning_rates 5.0 1.0 \
--learning_schedule 400 \
--depth_method packnet \
--depth_transform_func flip_vertical \
--depth_transform_value 0.00 \
--mask_constraint none \
--checkpoint_path perturbations/packnet/all_flipv_norm002_lr5e0_1e0 \
--depth_model_restore_path0 pretrained_models/packnet/velsup_csk/PackNet01_MR_velsup_CStoK.ckpt \
--device gpu

# Semantics based scaling
python src/run_perturb.py \
--image_path testing/kitti_semantic_test_vehicle_image.txt \
--class_mask_path testing/kitti_semantic_test_vehicle_label.txt \
--n_height 192 \
--n_width 640 \
--n_channel 3 \
--output_norm 0.02 \
--n_step 500 \
--learning_rates 5.0 1.0 \
--learning_schedule 400 \
--depth_method packnet \
--depth_transform_func multiply \
--depth_transform_value 1.10 \
--mask_constraint none \
--checkpoint_path perturbations/packnet/vehicle_mult110_norm002_lr5e0_1e0 \
--depth_model_restore_path0 pretrained_models/packnet/velsup_csk/PackNet01_MR_velsup_CStoK.ckpt \
--device gpu

# Instance removal
python src/run_perturb.py \
--image_path testing/kitti_instance_test_image.txt \
--class_mask_path testing/kitti_instance_test_label.txt \
--n_height 192 \
--n_width 640 \
--n_channel 3 \
--output_norm 0.02 \
--n_step 500 \
--learning_rates 5.0 1.0 \
--learning_schedule 400 \
--depth_method packnet \
--depth_transform_func remove \
--depth_transform_value 0.00 \
--mask_constraint none \
--checkpoint_path perturbations/packnet/instance_remove_all_mask_norm002_lr5e0_1e0 \
--depth_model_restore_path0 pretrained_models/packnet/velsup_csk/PackNet01_MR_velsup_CStoK.ckpt \
--device gpu

python src/run_perturb.py \
--image_path testing/kitti_instance_test_image.txt \
--class_mask_path testing/kitti_instance_test_label.txt \
--n_height 192 \
--n_width 640 \
--n_channel 3 \
--output_norm 0.02 \
--n_step 500 \
--learning_rates 5.0 1.0 \
--learning_schedule 400 \
--depth_method packnet \
--depth_transform_func remove \
--depth_transform_value 0.00 \
--mask_constraint within_mask \
--checkpoint_path perturbations/packnet/instance_remove_within_mask_norm002_lr5e0_1e0 \
--depth_model_restore_path0 pretrained_models/packnet/velsup_csk/PackNet01_MR_velsup_CStoK.ckpt \
--device gpu

python src/run_perturb.py \
--image_path testing/kitti_instance_test_image.txt \
--class_mask_path testing/kitti_instance_test_label.txt \
--n_height 192 \
--n_width 640 \
--n_channel 3 \
--output_norm 0.02 \
--n_step 500 \
--learning_rates 5.0 1.0 \
--learning_schedule 400 \
--depth_method packnet \
--depth_transform_func remove \
--depth_transform_value 0.00 \
--mask_constraint out_of_mask \
--checkpoint_path perturbations/packnet/instance_remove_out_of_mask_norm002_lr5e0_1e0 \
--depth_model_restore_path0 pretrained_models/packnet/velsup_csk/PackNet01_MR_velsup_CStoK.ckpt \
--device gpu

# Instance translation
python src/run_perturb.py \
--image_path testing/kitti_instance_test_image.txt \
--class_mask_path testing/kitti_instance_test_label.txt \
--n_height 192 \
--n_width 640 \
--n_channel 3 \
--output_norm 0.02 \
--n_step 500 \
--learning_rates 5.0 1.0 \
--learning_schedule 400 \
--depth_method packnet \
--depth_transform_func translate_horizontal \
--depth_transform_value 40 \
--mask_constraint none \
--checkpoint_path perturbations/packnet/instance_transh40_norm002_lr5e0_1e0 \
--depth_model_restore_path0 pretrained_models/packnet/velsup_csk/PackNet01_MR_velsup_CStoK.ckpt \
--device gpu

python src/run_perturb.py \
--image_path testing/kitti_instance_test_image.txt \
--class_mask_path testing/kitti_instance_test_label.txt \
--n_height 192 \
--n_width 640 \
--n_channel 3 \
--output_norm 0.02 \
--n_step 500 \
--learning_rates 5.0 1.0 \
--learning_schedule 400 \
--depth_method packnet \
--depth_transform_func translate_vertical \
--depth_transform_value 40 \
--mask_constraint none \
--checkpoint_path perturbations/packnet/instance_transv40_norm002_lr5e0_1e0 \
--depth_model_restore_path0 pretrained_models/packnet/velsup_csk/PackNet01_MR_velsup_CStoK.ckpt \
--device gpu